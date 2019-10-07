# LaTeX on Netlify

**Automatically compile and publish your LaTeX document on Netlify.**

See this repository published live at [`latex.netlify.com`](https://latex.netlify.com).

Start publishing your document automatically by clicking on the button below. It will clone this repository in your account and set up a Netlify site connected to it.

[![Deploy to Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/frangio/netlify-latex)

Edit the `main.tex` file or replace it with your own LaTeX file. Every update to your cloned repository will trigger a republish of the rendered document on Netlify.

##### Notes

The initial setup will take about 3 minutes to download and install a minimal LaTeX environment. All the necessary packages will be downloaded the first time they are seen by [`texliveonfly`](https://www.ctan.org/pkg/texliveonfly), without which this project would have been impractical.
