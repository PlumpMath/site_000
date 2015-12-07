

### site_000

Doing some more React + SVG stuff for a communications/publications sites, which plan to deploy to Heroku.

Dependencies are in a parent folder, which also contains stuff --like database tools-- unrelated to this client.

Here as a Gist [package.json](https://gist.github.com/kulicuu/f47ab8ec7f9f1933ee9b)

______________________

#### status notes:

This site runs only in Firefox because Chromium has a bug in their SVG rendering compounding with React's confused semi-support of SVG.

http://stackoverflow.com/questions/34131753/chromium-discarding-unexpected-node-not-rendering-svg-foreignobject-html

https://github.com/facebook/react/issues/1657

I've made the dependencies explicit in a package.json file. Locally I'd always gotten the dependencies from an ancestor folder's node-modules.

________________________________

### A note on the ~~architectural style~~ design pattern used:

I did some R&D this summer on building better web-apps.  Hit upon the idea of doing everything with SVG instead of HTML/CSS.  The idea being that HTML/CSS is best suited to typesetting, and that using it control the total graphical _space_ of a webapp is a terrible idea that should be corrected. Similarly, using a typesetting language to create the primitive pseudo-physical geometrically defined naive 'objects' like progress bars, butttons, instrumentation and on-screen controls is just innately a horrible usage of tools, which should be corrected. So will notice here that the overall GUI structure of the app is handled with SVGs, as is the build of (using) reusable primitive components that are scaled&translated as-needed with composable transform matrices according to the rules of homogeneous coordinates from linear algebra.  When we want do do some serious typesetting _(*1)_ we introduce HTML elements under the SVG `foreignObject` element construct.

_*1:_ Prose of non-negligible length would count as 'serious typesetting', whereas a simple text label on a control (e.g. 'submit' on a button) would not.  Creative (e.g. poetry) text content representation are another story; an application within whichI think SVG would have a clear advantage over HTML/CSS.

________________________



#### ttd:

###### figure out an alternative responsive resizing algorithm to enable zoom ; also default options for mobile devices, important to get actual device size dimensions and not just pixel dimensions.

Two different issues.  First is simply allowing user to zoom in and out as normal.  Second is setting default size and presentation based on physical screen size in addition to pixel count.

For the first, there must be many different ways of doing this.  

One idea is just to hijack all zoom events from the browser either by direct key combo grab + touchscreen gesture grab and perform state changes to sizing algo from that.  Browser API may also allow to know zoom state or other similarly relevant variables.

For the second issue, it's just a matter to query for parameters on load.  Something I'd like to get to implement fairly soon, since want people to be able to interact with system in different size screens.  Stress important to get physical size as well as pixel count.

