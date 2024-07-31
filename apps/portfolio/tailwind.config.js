/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./{lib,web}/**/*.dart', './content/**/*.md'],
  theme: {
    extend: {},
    fontFamily: {
      ibmPlexSansKR: ['IBM Plex Sans KR', 'sans-serif'],
    },
    listStyleType: {
      none: 'none',
      disc: 'disc',
      decimal: 'decimal',
      dash: '"- "',
    },
  },
  plugins: [require('@tailwindcss/typography')],
};
