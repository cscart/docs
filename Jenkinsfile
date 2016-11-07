/**
 * The pipeline to automate the process of building documents with Sphinx and deploying them to the server.
 *
 * The repository where documents are stored is to have the specific structure.
 *
 *     Single language (English) documents:
 *     /
 *     ├── document_1.rst
 *     ├── ...
 *     ├── document_n.rst
 *     ├── .hostinfo
 *     └── conf.py
 *
 *     Multi-language documents:
 *     /
 *     ├── language_1
 *     │   ├── document_1.rst
 *     │   ├── ...
 *     │   ├── document_n.rst
 *     │   ├── .hostinfo
 *     │   └── conf.py
 *     ├── ...
 *     └── language_n
 *         ├── document_1.rst
 *         ├── ...
 *         ├── document_n.rst
 *         ├── .hostinfo
 *         └── conf.py
 *
 * Special files:
 *     conf.py   - Sphinx configuration file. Only directories containing this file will be built.
 *     .hostinfo - Deployment information file. It contains SSH connection and deployment details in the form of
 *                     hostname[:port]
 *                     [deployment directory]
 *                 When no `port` is specified, 22 will be used.
 *                 When no `deployment directory` is specified, /var/www/html/hostname will be used.
 *                 E.g.:
 *                     1. Content of /en/.hostinfo is
 *                            docs.example.com:35022
 *                        Documents from /en/ directory will be uploaded to docs.example.com,
 *                        port 35022 will be used to connect via SSH,
 *                        documents will be deployed to /var/www/html/docs.example.com.
 *                     2. Content of /de/.hostinfo is
 *                            docs.example.de
 *                        Documents from /de/ directory will be uploaded to docs.example.de,
 *                        port 22 will be used to connect via SSH,
 *                        documents will be deployed to /var/www/html/docs.example.de.
 *                     3. Content of /no/.hostinfo is 
 *                            docs.example.no
 *                            /var/www/html/example.no/documents
 *                        Documents from /no/ directory will be uploaded to docs.example.no,
 *                        port 22 will be used to connect via SSH,
 *                        documents will be deployed to /var/www/html/example.no/documents.
 *
 *                 Credentials have to be configured in Jenkins to deploy documents to the host:
 *                     -- SSH Agent Plugin (http://wiki.jenkins-ci.org/display/JENKINS/SSH+Agent+Plugin) has to be installed.
 *                     -- Credentials' Kind has to be set to `SSH Username with private key`.
 *                     -- Credentials' ID   has to be set to `deploy-docs`.
 */
node {

    /**
     * @var String sphinxConfFile Name of the Sphinx configuration file
     */
    def sphinxConfFile = 'conf.py'

    /**
     * @var ArrayList languages Languages in the current branch to build documents for
     */
    def languages = []

    /**
     * @var Map actionsToParallel Closures to build single languages
     */
    def actionsToParallel = [:]

    stage('Checking out latest changes') {

        checkout scm
    }

    stage('Collecting languages to build') {

        // Based on the used branch, documents are stored
        // either in the root or in the %langCode% directories
        if (fileExists(sphinxConfFile)) {
            languages << [
                langCode: 'en',
                srcDir: '.'
            ]
        } else {
            def repoDirs = getDirsList(env.WORKSPACE)
            for (i = 0; i < repoDirs.size(); i++) {
                // check against sphinx config file
                if (fileExists("${repoDirs[i]}/${sphinxConfFile}")) {
                    languages << [
                        langCode: repoDirs[i],
                        srcDir: repoDirs[i]
                    ]
                }
            }
        }
    }

    stage('Building languages') {

        for (i = 0; i < languages.size(); i++) {
            actionsToParallel[languages[i].langCode] = getBuildLanguageClosure(languages[i], env.WORKSPACE, env.BRANCH_NAME)
        }

        parallel(actionsToParallel)
    }
}

/**
 * Gets directories in a directory.
 *
 * @param String dirToList Directory to list directories from
 *
 * @return ArrayList
 */
def getDirsList(dirToList) {

    def dirsList = []

    dir(dirToList) {

        dirsList = sh(
            script: "ls -1d */ | cut -d'/' -f1",
            returnStdout: true
        ).trim().split("\n")
    }

    return dirsList
}

/**
 * Provides the closure to build single language.
 *
 * @param Map    language     Language info
 * @param String workspaceDir Primary workspace directory
 * @param String branchName   Branch where build is performing
 *
 * @return Closure
 */
def getBuildLanguageClosure(language, workspaceDir, branchName) {

    return {
        node {
            def buildDir       = "_build/${language.langCode}/${branchName}"
            def artifactName   = "${language.langCode}-${branchName}.tgz"
            def authIdentifier = 'deploy-docs'

            dir("${workspaceDir}/${language.srcDir}") {

                // build and compress
                sh(
                    script: "sphinx-build -aEq . ${buildDir}"
                )
                sh(
                    script: "tar -czf ${artifactName} ${buildDir}/*"
                )

                archiveArtifacts "${artifactName}"

                // deploy to remote host
                if (fileExists('.hostinfo')) {
                    def hostInfo = getHostInfo('.hostinfo')

                    deployArtifactToHost(artifactName, hostInfo, authIdentifier)
                }

                // delete directory where docs were built
                dir(buildDir) {
                    deleteDir()
                }
            }
        }
    }
}

/**
 * Provides a host connection and deployment information.
 *
 * @param String infoFile File with host information
 *
 * @return Map Hostname, port, deploy directory
 */
def getHostInfo(infoFile) {

    def hostAndDir = readFile(infoFile).trim().split("[\\r\\n]+")
    def hostAndPort = hostAndDir[0].trim().split(':')
    
    def hostInfo = [
        name: hostAndPort[0],
        port: 22,
        dir: "/var/www/html/${hostAndPort[0]}"
    ]

    if (hostAndDir.size() > 1) {
        hostInfo.dir = hostAndDir[1]
    }

    if (hostAndPort.size() > 1) {
        hostInfo.port = hostAndPort[1]
    }

    return hostInfo
}

/**
 * Uploads and unpacks artifact to the remote host.
 *
 * @param String artifactName   Archive with an artifact
 * @param Map    hostInfo       Host connection and deployment information
 * @param String authIdentifier Auth credentials for remote host specified in ssh-agent plugin
 */
def deployArtifactToHost(artifactName, hostInfo, authIdentifier) {

    def tmpDir = '/tmp'
    def ssh = "ssh ${hostInfo.name} -p ${hostInfo.port}"
    
    sshagent(credentials: [authIdentifier]) {

        sh(
            script: "scp -P ${hostInfo.port} ${artifactName} ${hostInfo.name}:${tmpDir}"
        )
        sh(
            script: "${ssh} mkdir -p ${hostInfo.dir}"
        )
        sh(
            script: "${ssh} tar --strip-components 2 -xzf ${tmpDir}/${artifactName} -C ${hostInfo.dir}"
        )
        sh(
            script: "${ssh} rm ${tmpDir}/${artifactName}"
        )
    }
}
