        if ($field['type'] == 'enum') {
            $value = Block::instance()->getItems($template_variable, $block, $block_scheme);
        }