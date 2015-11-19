<?php

add_shortcode( 'slid.es', 'inline_reveal_js_slid_es');

function inline_reveal_js_slid_es( $atts ) {
	$defaultUrl = 'http://slid.es/news/welcome-to-slides';
	$defaultWidth = 576;
	$defaultHeight = 420;

	extract( shortcode_atts( array(
			'width' => $defaultWidth,
			'height' => $defaultHeight,
			'url' => $defaultUrl
	), $atts ) );

	if($url === '') {
		$url = $defaultUrl;
	}

	if($width === '') {
		$width = $defaultWidth;
	}

	if($height === '') {
		$height = $defaultHeight;
	}

	$embedAppend = !strpos($url, '/embed');
	if($embedAppend) {
		$url .= '/embed';
	}

	$template =	'<iframe src="'.$url.'" width="'.$width.'" height="'.$height.'" scrolling="no" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>';

return $template;
}