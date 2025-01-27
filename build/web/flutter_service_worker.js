'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "b13e59bec04eb409e25b34ebd2729fc9",
"version.json": "db494c01ff14487a0ab209ea6e3194fa",
"index.html": "273d44acb67385157402c65603817f52",
"/": "273d44acb67385157402c65603817f52",
"main.dart.js": "5852829f285cadaec79faa8db8db2269",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "8ca9b3df47688c20dbe2c5fdbde32ee7",
".git/config": "d6d8c385d7e476478b08a3ba6c1ab299",
".git/objects/59/4da011ad2a079344c7f0796db602711b1a7ed6": "d9b74a1b4858069dff7021e0a266deb2",
".git/objects/50/08ddfcf53c02e82d7eee2e57c38e5672ef89f6": "d18c553584a7393b594e374cfe29b727",
".git/objects/68/dc59c3de8f4cfb3b7280c96188522c7297eafc": "0de9c94a1ba9504ad545ab0646366410",
".git/objects/57/bba1b40ac5f2cfbcb79a0e5f8b9c94d96d329a": "0072edc8967a88352a0a7ced2542457b",
".git/objects/03/a649a41ef7b0274bde80b6da0c1dd36e6eca49": "f56c0d2b2485f139097acdea3d270615",
".git/objects/32/aa3cae58a7432051fc105cc91fca4d95d1d011": "4f8558ca16d04c4f28116d3292ae263d",
".git/objects/32/02cb3041c5a5b06d2583b56a213126660148cb": "4247f06208f312f80518f3169251b2b7",
".git/objects/35/f8b50d6faf2291e79903081c736f03f1f0a8c0": "4db268f5d0706dd620d59fcc44898831",
".git/objects/69/c0ae91e81d35c9291d56d7de82e7e355d9607b": "b515079c9b9f2dc7b78438d557bc01e9",
".git/objects/0b/55b170515819512a4c59ba421918567676a41e": "bf0fdf95675e907c44f676442407bcbf",
".git/objects/33/026d1dcf3e53f4b2c99cd1605dd28f4498a782": "53018e9d9fc7b45acc5d88b98085aba6",
".git/objects/33/815eb931454a916ece84f3535936b21b67373f": "8bdac45ea852f0e7281e2487cfab9552",
".git/objects/02/ff6fff07885b50373c35a6f59819b68e3ca8f3": "5da2ce61fd26311760edfa680b6dd662",
".git/objects/ac/60cec58d2825faf25121245e400fb2e8275899": "5205d2c2a38d17b7f695cad1836c72ea",
".git/objects/ac/277f2672e5598035bbdc31638a26a2cf873c90": "d7f0c58742562d457537c4bcbc6bbcf4",
".git/objects/d0/23371979cf1e985205df19078051c10de0a82d": "700b71074bad7afee32068791dec7442",
".git/objects/be/c575c6fe5231423e7c999c4ed4f50cf0009689": "cc94d534e73ac0e0097dc63bc1019a6b",
".git/objects/b3/432c32de2e1ba604d6c2722fcee08ba6fa61c9": "dfbe048d9aa81d2ed120d2fb85aeda7a",
".git/objects/da/fd65422747502c19b5c74b4230282644d2169c": "d8a62caf99a372ff6c7692e143787ce3",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/ae/51d92435f31b1937a3eeac4261e0e6820b5108": "d9ec144806b7ed0eb34a528e5a624fff",
".git/objects/d8/93c5abce7e92d00c9c336630596b50b26c0e81": "733f960803472d5697177de70bd55c98",
".git/objects/e5/cb0fe0864172f627bd7f75a345cbb73a839ed8": "486539ad32d0d6351786d75e6b8cd673",
".git/objects/e5/777e70635591501ea5d49f2fd72655fe4925bc": "10f54881e62b00f3fe0d8c88bca3ccfa",
".git/objects/f4/9b2894db276941ad2425d63d54f3744e6eef21": "c89a03ab51e9a8f7ef2d815b6d589721",
".git/objects/f3/22c3345b45b34e38ca7165c80fa12d58fd86c0": "c4cc81e6cc37ef95ae9f34ef785d34a7",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/c9/2633ec384cd60170c2643833fadddf8cc497d5": "70e528c2ebe0b68a60ddd245c95e164b",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/c8/b6e65e66498f874512b1c0a7813b951eef3367": "d0dd113f32825366010fbf9a3e70e974",
".git/objects/fb/978c41b6520bcc2fc92010b172e50be3c7f4a6": "da4045e9d25afe138b4345490a3615c0",
".git/objects/fb/ab19d199af8ae03f57f93fcaadf188eb932b03": "cfa4a6750d352b8f5f1047d6770c91d8",
".git/objects/c1/aeff2291342dd3f6344e909b86ed4cd83177d3": "053db07fa31491998e86fd5e48d15d54",
".git/objects/c6/f2617d427b7acc332de115656e8472a66ee76c": "d0da9969412429d95f6bc5725b52508e",
".git/objects/20/707d56465e01db1ad143763cfae28ca49d4855": "04125f943396f237dc0720cadb9414fc",
".git/objects/27/2e9f367ae1765209d24c640f05ecaa59934bfc": "1b0f9caed23506f1bfbcb94d9d7095b6",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/87/379f3feba0d4fbeaa2689619a853c928583cce": "5e7fad11e27cf064845c9683d1692d7f",
".git/objects/8f/dffccf2364a120b555c9cf49d9fbf5b6536a04": "c23718505e6779aa1346284346df41db",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/4c/2ac6f47b2aee69f7f3d0b912d280473e7a9545": "2735af01666b11e367b8ab16a1508adf",
".git/objects/26/1dca8caaa65e67166f5668be12d2102174cf34": "2222828ae8619df2c0597f263e3dc8f7",
".git/objects/81/513c51b2036bc366b61ba6528d9d660d19c1ff": "200ff87450c3f38f43e0230d6a9eb480",
".git/objects/44/a8b8e41b111fcf913a963e318b98e7f6976886": "5014fdb68f6b941b7c134a717a3a2bc6",
".git/objects/2f/1fc34af529f5ece9e8761f97285008721937d2": "0894dac9ff51a9649b33d46ef6d8e4c4",
".git/objects/2f/2a3f0b16e6b81819fee788a2056fc53634b89d": "3e9bfbe26e6ae10ae47aed6d85f575dc",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/6b/e909fbf40b23748412f0ea89bf0fae827ed976": "5f118419157d9534688915220cc803f7",
".git/objects/38/f72c3b661274731c0dca4263c6147292c3313e": "06ec909689545717240ec77454003efe",
".git/objects/5c/854c44257b7b69fa690b2f113854de30ab0095": "a8a7b9782d5db37e0f0cecc653919929",
".git/objects/5c/88739bdf1b4aec798fb58c873483a08a538b2a": "56696b488f8365e771240915ac8ceb9e",
".git/objects/3a/7525f2996a1138fe67d2a0904bf5d214bfd22c": "ab6f2f6356cba61e57d5c10c2e18739d",
".git/objects/98/57c9b3b0448c92818efc5fda0f206b21914168": "ecbde07c564dabbec0f249821051b8af",
".git/objects/08/32d0db2def1613c1c45aa4fe9156a1c6b7d589": "e05df183e5eeaddf39672a2516f9c41d",
".git/objects/6d/219764013612bac7b396c6a378ae1434a23c93": "e5d72ab022b1b514ccd728948f8f8c34",
".git/objects/63/c52acaba6a7e131af2865b3763aae7c356fffa": "1cf9510df4d319ed6a7ecc628f0acce4",
".git/objects/0f/d7e63f5f96f04bd3ba9d4f6e98ebd6fbcb9e43": "4d4c57b57fd2e94c42946a772b492e2e",
".git/objects/0a/a778b3d2b1eeb9534b643c36e2420dd2f16b25": "5b6fbc3f20bf8850261f351bf5e25d48",
".git/objects/90/bcfcf0a77ab618a826db0fd8b0942963b653af": "fc109675cdf1233dd6599a4c3c0a7a69",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d4/7a5f7272ff4b8ced8bb1f00dc571deecfbb8b0": "288be8a8ef45b9645894d65302298352",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/a9/8ec08924172123066ecc9aac73cab86a44f299": "51cd7f2dfee0548e1b55a9d094a3ad96",
".git/objects/af/b42deb6ba882b4cb1a852dc4cde9c4115c57f3": "9a22431c8692390d320b9ae36fc295ba",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/cc/f50a5213911955c94cd97be5c4ca9691ffd3a2": "8e2b51c732cb0eb8e137b644c11232e2",
".git/objects/cc/31eb308d5772b61803c0477b623544bf047177": "74264f9c5f91e6b4a622937ee8c6c85b",
".git/objects/e8/15ed81b5c9831454369e97ada6acd4ca2e0439": "b1df78124e4ec083935ce7a7cfbfebe8",
".git/objects/c2/4e29b4ca2fe9bb4c3ec0be226e6d384fb0e2e8": "4bae23acbbf4bfe76f576ffa32dc4e3d",
".git/objects/46/b3583c5fd4c82cdd3d5ee7a4403cb4896bc1a6": "8bd74ad23834222b8e4f5cef2f21cca1",
".git/objects/77/db464ae15be9e1417f1ca9a6790141f2975fc2": "7dcbf5d5e456852b8e87de8730843de8",
".git/objects/48/ba65ed33dff18e74c62b0f08d8165db64a3085": "9aa3a7fdcbc6e5a4b96701d6dc3f541c",
".git/objects/84/0516208d35dcb4298847ab835e2ef84ada92fa": "36a4a870d8d9c1c623d8e1be329049da",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/2e/5d657b528b02a54e0ae65354b3ac5d78dbde8d": "33388f2413e4fce3176e464ab751d910",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "35edfed74673539f4b9dc1f43a981f4f",
".git/logs/refs/heads/main": "39c3e5cb282d9f4deff5e64adae34e3a",
".git/logs/refs/remotes/origin/main": "c15f5d7d1b5d94fd7a36b443af3ad8a5",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "63d2f2d67579b7525baf473106a5d595",
".git/refs/remotes/origin/main": "63d2f2d67579b7525baf473106a5d595",
".git/index": "33af97737f79a1e9539fe26f76cc3f30",
".git/COMMIT_EDITMSG": "6fd89bc5f8c9b7c79b25a95698359e81",
"assets/AssetManifest.json": "3e885e96057f21fcb7e35ac8bc1cd53a",
"assets/NOTICES": "8dadcae6f5cbc035647d447933805360",
"assets/FontManifest.json": "7b7cf6a41a6b00d8387712e2be9e84fd",
"assets/AssetManifest.bin.json": "85e71d13c6f5017aede035b5c27b72c1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/youtube_player_iframe/assets/player.html": "663ba81294a9f52b1afe96815bb6ecf9",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "afdce600cc01b2eea4cd2d4e7bee004d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "8f1b490b7ff29b3b49d2e5e506b219d4",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "f03e08b279622e7f2300bb02e6bf005f",
"assets/fonts/MaterialIcons-Regular.otf": "45fd2c7c8159dde136a7e9ff19b62051",
"assets/assets/images/who_we_are.jpg": "a167424b183a167ba40f62570bca21f9",
"assets/assets/images/social_icon.png": "6afa913d9dacd4f9c3d83f9e674f2769",
"assets/assets/images/product_icon.png": "fb4bcde70a7d4a71c9e2f32e567e3b15",
"assets/assets/images/primary_logo.png": "7df784e13329aad2e96b455a0ff64637",
"assets/assets/images/primary_logo_horizontal.png": "1fa7e94f5fd69a0b1748d667323c4d6d",
"assets/assets/images/health_hub_icon.png": "2bbeb94aba812fe57f1d8d735ca844bb",
"assets/assets/fonts/Inter_24pt-Medium.ttf": "4591e900425d177e6ba268d165bf12e8",
"assets/assets/fonts/Montserrat-Bold.ttf": "354dc625a35bef1b6ec00a79c6cfc0c8",
"assets/assets/fonts/Inter_24pt-Bold.ttf": "8b04b3bd9435341377d7f4b4d68b6ecc",
"assets/assets/fonts/Montserrat-Regular.ttf": "38712903602f88435ddddec98862f8b8",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
