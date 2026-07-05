import { optimize } from 'svgo';
import sharp from 'sharp';
import { glob } from 'glob';
import path from 'path';
import fs from 'fs';

async function optimizeImages() {
  const imageFiles = await glob(`web/**/*.{svg,jpg,jpeg,png}`);

  console.log(`Found ${imageFiles.length} images to convert...`);

  await Promise.all(
    imageFiles.map(async (file) => {
      const ext = path.extname(file);
      const outputPath = path.join('build/jaspr', path.relative('web', file));

      const outputDir = path.dirname(outputPath);
      if (!fs.existsSync(outputDir)) {
        fs.mkdirSync(outputDir, { recursive: true });
      }

      try {
        if (ext.toLowerCase() === '.svg') {
          const svgContent = fs.readFileSync(file, 'utf-8');
          const optimizedSvg = optimize(svgContent, {
            path: file,
            multipass: true,
            plugins: [
              {
                name: 'preset-default',
                params: {
                  overrides: {
                    cleanupNumericValues: false,
                    cleanupIds: {
                      minify: false,
                      remove: false,
                    },
                    convertPathData: false,
                  },
                },
              },
              'sortAttrs',
              {
                name: 'addAttributesToSVGElement',
                params: {
                  attributes: [{ xmlns: 'http://www.w3.org/2000/svg' }],
                },
              },
            ],
          });
          fs.writeFileSync(outputPath, optimizedSvg.data);
        } else {
          await sharp(file)
            .webp({ lossless: true })
            .toFile(outputPath.replace(new RegExp(`${ext}$`, 'i'), '.webp'));
        }

        console.log(`✅ Converted: ${file}`);
      } catch (error) {
        console.error(`❌ Failed to convert ${file}:`, error);
      }
    }),
  );

  console.log('🎉 Batch conversion complete!');
}

optimizeImages();
