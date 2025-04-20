import laravel from 'laravel-vite-plugin';
import {defineConfig} from 'vite';

export default defineConfig({
plugins:
    [
      laravel({
        input : [
          'resources/css/app.css',
          'resources/js/app.js',
          'resources/js/allProductsScreenAdjuster.js',
          'resources/js/loadMaxImages.js',
          'resources/js/responsiveHeader.js',
          'resources/js/displayCartItems.js',
        ],
        refresh : true,
      }),
    ],
    safelist: [
      'w-80',
      'h-50',
      'max-h-50',
      'max-w-2xl',
      'bg-neutral-300',
      'rounded-2xl',
      'overflow-hidden',
    ]
});
