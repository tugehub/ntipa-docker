<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 * @package Moesia
 */
?>

	</div><!-- #content -->
	<?php if ( is_active_sidebar( 'sidebar-3' ) || is_active_sidebar( 'sidebar-4' ) || is_active_sidebar( 'sidebar-5' ) ) : ?>
		<?php get_sidebar('footer'); ?>
	<?php endif; ?>

	<footer id="colophon" class="site-footer" role="contentinfo">
		<div class="site-info container">
			<a href="<?php echo esc_url( __( 'http://www.ntipa.com/chi-siamo/', 'moesia' ) ); ?>"><?php printf( __( 'Copyright ©', 'moesia' ), 'Copyright' ); ?>
			<?php echo date("Y") ?><?php printf( __( ' Innovazione e tecnologie', 'moesia' ), 'Innovazione e tecnologie' ); ?></a>
			<span class="sep"> | </span>
			<?php printf( __( ' p.iva: 04501760757 - Tutti i diritti riservati', 'moesia' ), 'Tutti i diritti riservati'); ?>
		</div><!-- .site-info -->
	</footer><!-- #colophon -->
</div><!-- #page -->

<?php wp_footer(); ?>

</body>
</html>
