fn_set_hook('render_blocks', $grid, $block, $this, $content);

fn_print_r($block);

if ($this->_area == 'C' && $block['status'] == 'D') {
    // Do not render block in frontend if it disabled
    continue;
}
