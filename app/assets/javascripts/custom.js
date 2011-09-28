/**
 * @author Chris
 */

function updatePhrases (path) {
    setInterval(function() {
        $("#updateDiv").load(path + '/phrases');
    }, 30000);
}

function refreshPage () {
    setInterval(function() {
        location.reload();
         $('html, body').animate({scrollTop: $(document).height()}, 'slow');
    }, 30000);
}