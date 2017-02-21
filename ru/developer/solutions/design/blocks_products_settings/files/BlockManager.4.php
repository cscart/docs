fn_set_hook('render_blocks', $grid, $block, $this, $content);

if ($this->_area == 'C' && $block['status'] == 'D') {
    // Do not render block in frontend if it disabled
    continue;
}

$content .= self::renderBlock($block, $grid, $this->_area);