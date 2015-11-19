jQuery(document).ready(function($) {

    tinymce.create('tinymce.plugins.inline_reveal_js_plugin', {
        init : function(ed, url) {
                // Register command for when button is clicked
                ed.addCommand('inline_reveal_js_insert_shortcode', function() {
                    selected = tinyMCE.activeEditor.selection.getContent();

                    if( selected ){
                        //If text is selected when button is clicked
                        //Wrap shortcode around it.
                        content =  '[slid.es url="" width="" height=""]'+selected+'[/slid.es]';
                    }else{
                        content =  '[slid.es url="" width="" height=""]';
                    }

                    tinymce.execCommand('mceInsertContent', false, content);
                });

            // Register buttons - trigger above command when clicked
            ed.addButton('inline_reveal_js_button', {title : 'Insert slid.es deck', cmd : 'inline_reveal_js_insert_shortcode', image: url + '/../img/slides-symbol-600x600.png' });
        },   
    });

    // Register our TinyMCE plugin
    // first parameter is the button ID1
    // second parameter must match the first parameter of the tinymce.create() function above
    tinymce.PluginManager.add('inline_reveal_js_button', tinymce.plugins.inline_reveal_js_plugin);
});