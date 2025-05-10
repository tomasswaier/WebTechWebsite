import forms from '@tailwindcss/forms';
import defaultTheme from 'tailwindcss/defaultTheme';

/** @type {import('tailwindcss').Config} */
export default {
  content:
      [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
        './resources/views/*.blade.php',
        './resources/js/**/*.js',
        './resources/js/*.js',
        './resources/views/**/**/*.blade.php',
      ],
  safelist:
      [
        {
          pattern : /bg - \[#([ a - fA - F0 - 9 ]{3, 6})\] /,
          variants : [ 'hover', 'focus' ],
        },

        //'bg-[#c01c28]',
        //'bg-[#ffffff]',
      ],

  theme: {
    extend: {
      fontFamily: {
        sans: [ 'Figtree', ...defaultTheme.fontFamily.sans ],
      },
    },
  },

  plugins: [ forms ],
};
