<script type="text/javascript">

    (function(_, $) {

        // Узнаем текущий контроллер из SMARTY переменной
        var controller = '{$runtime.controller}';

        // Узнаем какой mode контроллера из SMARTY переменной
        var mode = '{$runtime.mode}';

        // Выведем на экран
        alert(controller + ':' + mode);    

    }(Tygh, Tygh.$));

</script>
