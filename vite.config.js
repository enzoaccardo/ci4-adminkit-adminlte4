import { defineConfig } from 'vite';
import { resolve } from 'path';

// Ricompila il tema AdminLTE 4 (Bootstrap 5 + SCSS/TS) da resources/ verso
// assets/dist/. Opzionale: gli asset compilati (app.css/app.js) sono già
// versionati in assets/dist/, quindi il consumer NON deve avere Node per usarli
// — questo build serve solo a chi vuole personalizzare/ricompilare il tema.
export default defineConfig({
    publicDir: false,
    build: {
        outDir: 'assets/dist',
        emptyOutDir: true,
        rollupOptions: {
            input: {
                app: resolve(__dirname, 'resources/js/app.js'),
            },
            output: {
                entryFileNames: '[name].js',
                chunkFileNames: '[name].js',
                assetFileNames: '[name].[ext]',
            },
        },
    },
    css: {
        preprocessorOptions: {
            scss: {
                quietDeps: true,
            },
        },
    },
});
