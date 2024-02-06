/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [],
  theme: {
    extend: {},
    listStyleType: {
      none: 'none',
      disc: 'disc',
      decimal: 'decimal',
      dash: '"- "',
    },
  },
  plugins: [require('@tailwindcss/typography')],
};
