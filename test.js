const puppeteer = require('puppeteer')

;(async () => {
  const browser = await puppeteer.launch({
    headless: true,
    args: [
    '--use-gl=swiftshader',
    '--no-sandbox',
    '--enable-surface-synchronization'
    ],
  })

  const page = await browser.newPage()
  await page.setViewport({ width: 1920, height: 1080})
  await page.goto('https://threejs.org/examples/#webgl_animation_skinning_blending')
  
  // Wait for three.js canvas
  await page.waitForTimeout(2000)
  await page.screenshot({ path: 'my_screenshot.png' })

  // Keeps docker container running 	
  while(true) {
      await new Promise(resolve => setTimeout(resolve, 1000));
  }
})()