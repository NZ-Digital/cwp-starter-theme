// Define globally exposed module objects
/* eslint-disable */
// Define dependency imports
import util from 'bootstrap/js/src/util';
import collapse from 'bootstrap/js/src/collapse';
import dropdown from 'bootstrap/js/src/dropdown';
import carousel from 'bootstrap/js/src/carousel';
import tooltip from 'bootstrap/js/src/tooltip';
import popover from 'bootstrap/js/src/popover';
import modal from 'bootstrap/js/src/modal';
import tab from 'bootstrap/js/src/tab';
import highlight from 'jquery-highlight/jquery.highlight';

// Define local components
import navigation from './components/navigation';
import content from './components/content';
import sitemap from './components/sitemap';
import search from './components/search';
import form from './components/form';
import img from './components/img';
import mods from './components/mods';

navigation();
content();
sitemap();
search();
form();
img();
mods();
/* eslint-enable */
