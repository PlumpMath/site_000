

### site_000

Doing some more React + SVG stuff for a communications/publications sites, which plan to deploy to Heroku.

Dependencies are in a parent folder, which also contains stuff --like database tools-- unrelated to this client.

Here as a Gist [package.json](https://gist.github.com/kulicuu/f47ab8ec7f9f1933ee9b)

________________________________



#### ttd:

###### figure out an alternative responsive resizing algorithm to enable zoom ; also default options for mobile devices, important to get actual device size dimensions and not just pixel dimensions.

Two different issues.  First is simply allowing user to zoom in and out as normal.  Second is setting default size and presentation based on physical screen size in addition to pixel count.

For the first, there must be many different ways of doing this.  

One idea is just to hijack all zoom events from the browser either by direct key combo grab + touchscreen gesture grab and perform state changes to sizing algo from that.  Browser API may also allow to know zoom state or other similarly relevant variables.

For the second issue, it's just a matter to query for parameters on load.  Something I'd like to get to implement fairly soon, since want people to be able to interact with system in different size screens.  Stress important to get physical size as well as pixel count.

