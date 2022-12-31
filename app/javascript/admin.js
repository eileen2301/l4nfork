// Libraries
import '@hotwired/turbo-rails';

// Our components
import BootstrapTooltips from './components/bootstrap_tooltips';
import Translations from './components/translations';
import '@fortawesome/fontawesome-free/js/all';

window.FontAwesome.config.mutateApproach = 'sync';

Translations.setup();

// Our controllers
import './controllers/admin.js';

document.addEventListener('turbo:load', function () {
  BootstrapTooltips.setup();
});
