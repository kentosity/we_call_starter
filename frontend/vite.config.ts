import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  server: {
    host: true,
    proxy: {
      "/api": {
        target: process.env.BACKEND_API_URL,
        changeOrigin: true,
        secure: false,
        rewrite: (path) => path.replace(/^\/proxy/, ""),
      },
    },
  },
});
