<?php

if ( ! defined('ABSPATH') ) {
    die('Please do not load this file directly!');
}

//Plugin customizer options
function moesia_fonts_extended_customizer( $wp_customize ) {


    //Add a class for titles
    class Moesia_Fe_Info extends WP_Customize_Control {
        public $type = 'info';
        public $label = '';
        public function render_content() {
        ?>
            <h3 style="text-decoration: underline; color: #DA4141; text-transform: uppercase;"><?php echo esc_html( $this->label ); ?></h3>
        <?php
        }
    }


    $wp_customize->add_panel( 'moesia_ext_panel', array(
        'priority'       => 30,
        'capability'     => 'edit_theme_options',
        'theme_supports' => '',
        'title'          => __('Moesia Extensions', 'moesia'),
        'description'    => '',
    ) );

    $wp_customize->add_section(
        'moesia_fe',
        array(
            'title' => __('Fonts extension', 'moesia'),
            'priority' => 10,
            'panel'  => 'moesia_ext_panel',            
        )
    );

    //___Fonts___// 
    //*Body
    $wp_customize->add_setting('moesia_options[info]', array(
            'type' => 'info_control',
            'capability' => 'edit_theme_options',
            'sanitize_callback' => 'moesia_no_sanitize',            
        )
    );
    $wp_customize->add_control( new Moesia_Fe_Info( $wp_customize, 'fe_b', array(
        'label' => __('Body fonts', 'moesia'),
        'section' => 'moesia_fe',
        'settings' => 'moesia_options[info]',
        'priority' => 10
        ) )
    );
    //Body fonts
    $wp_customize->add_setting(
        'body_font_name',
        array(
            'default' => 'Roboto:400,400italic,700,700italic',
            'sanitize_callback' => 'moesia_fe_sanitize_text',
        )
    );
    $wp_customize->add_control(
        'body_font_name',
        array(
            'label' => __( 'Font name/style/sets', 'moesia_fe' ),
            'section' => 'moesia_fe',
            'type' => 'text',
            'priority' => 11
        )
    );
    //Body fonts family
    $wp_customize->add_setting(
        'body_font_family',
        array(
            'default' => '\'Roboto\', sans-serif',
            'sanitize_callback' => 'moesia_fe_sanitize_text',
        )
    );
    $wp_customize->add_control(
        'body_font_family',
        array(
            'label' => __( 'Font family', 'moesia_fe' ),
            'section' => 'moesia_fe',
            'type' => 'text',
            'priority' => 12
        )
    ); 

    //*Headings
    $wp_customize->add_setting('moesia_options[info]', array(
            'type' => 'info_control',
            'capability' => 'edit_theme_options',
            'sanitize_callback' => 'moesia_no_sanitize',            
        )
    );
    $wp_customize->add_control( new Moesia_Fe_Info( $wp_customize, 'fe_h', array(
        'label' => __('Headings fonts', 'moesia'),
        'section' => 'moesia_fe',
        'settings' => 'moesia_options[info]',
        'priority' => 13
        ) )
    );    

    //Headings fonts
    $wp_customize->add_setting(
        'headings_font_name',
        array(
            'default' => 'Roboto+Condensed:700',
            'sanitize_callback' => 'moesia_fe_sanitize_text',
        )
    );
    $wp_customize->add_control(
        'headings_font_name',
        array(
            'label' => __( 'Font name/style/sets', 'moesia_fe' ),
            'section' => 'moesia_fe',
            'type' => 'text',
            'priority' => 14
        )
    );
    //Headings fonts family
    $wp_customize->add_setting(
        'headings_font_family',
        array(
            'default' => '\'Roboto Condensed\', sans-serif',
            'sanitize_callback' => 'moesia_fe_sanitize_text',
        )
    );
    $wp_customize->add_control(
        'headings_font_family',
        array(
            'label' => __( 'Font family', 'moesia_fe' ),
            'section' => 'moesia_fe',
            'type' => 'text',
            'priority' => 15
        )
    );
}
add_action( 'customize_register', 'moesia_fonts_extended_customizer' );

//Text
function moesia_fe_sanitize_text( $input ) {
    return wp_kses_post( force_balance_tags( $input ) );
}