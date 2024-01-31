const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        zenkure: ['Zen Kurenaido', 'sans-serif']
      },
      colors: {
        beige: '#f5f5dc'
      },
      animation: {
        ping: 'ping 1s infinite',
        'ping-delay-200': 'ping 1s infinite 200ms',
        'ping-delay-400': 'ping 1s infinite 400ms',
        'ping-delay-600': 'ping 1s infinite 600ms',
        'ping-delay-800': 'ping 1s infinite 800ms',
        'ping-delay-1000': 'ping 1s infinite 1000ms',
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
