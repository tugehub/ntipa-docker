<?php

if ( ! defined('ABSPATH') ) {
    die('Please do not load this file directly!');
}



function moesia_fonts_extended() {
    if ( get_theme_mod('body_font_name') !='' ) {
        wp_enqueue_style( 'moesia-fe-body-fonts', '//fonts.googleapis.com/css?family=' . esc_attr(get_theme_mod('body_font_name')) ); 
    } else {
        wp_enqueue_style( 'moesia-fe-body-fonts', '//fonts.googleapis.com/css?family=Roboto:400,400italic,700,700italic');
    }

    if ( get_theme_mod('headings_font_name') !='' ) {
        wp_enqueue_style( 'moesia-fe-headings-fonts', '//fonts.googleapis.com/css?family=' . esc_attr(get_theme_mod('headings_font_name')) ); 
    } else {
        wp_enqueue_style( 'moesia-fe-headings-fonts', '//fonts.googleapis.com/css?family=Roboto+Condensed:700'); 
    }
}
add_action( 'wp_enqueue_scripts', 'moesia_fonts_extended' );

function moesia_fe_custom_styles($custom) {

    //Fonts
    $body_fonts = get_theme_mod('body_font_family');    
    $headings_fonts = get_theme_mod('headings_font_family');
    if ( $body_fonts !='' ) { ?>
    <style>
        <?php echo 'body { font-family:' . $body_fonts . ';}'; ?>
    </style>
    <?php   
    }
    if ( $headings_fonts !='' ) {?>
    <style>
        <?php echo 'h1, h2, h3, h4, h5, h6, .main-navigation li, .fact, .all-news, .welcome-button, .call-to-action .employee-position, .post-navigation .nav-previous, .post-navigation .nav-next, .paging-navigation .nav-previous, .paging-navigation .nav-next { font-family:' . $headings_fonts . ';}'; ?>
    </style>
    <?php        
    } 
}
add_action('wp_head','moesia_fe_custom_styles');  