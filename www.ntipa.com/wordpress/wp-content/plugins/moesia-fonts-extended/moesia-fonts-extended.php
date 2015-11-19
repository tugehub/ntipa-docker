<?php
/**
 * Plugin Name: Moesia - Fonts Extended
 * Plugin URI: http://athemes.com
 * Description: This plugin lets you use any Google Fonts with Moesia
 * Version: 1.00
 * Author: aThemes
 * License: GPLv2 or later
 */

/*  Copyright 2015  athemes.com

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License, version 2, as 
    published by the Free Software Foundation.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

if ( ! defined('ABSPATH') ) {
	die('Please do not load this file directly!');
}



//Plugin customizer options
require_once plugin_dir_path( __FILE__ ) . 'lib/fe-customizer.php';
require_once plugin_dir_path( __FILE__ ) . 'lib/fe-output.php';