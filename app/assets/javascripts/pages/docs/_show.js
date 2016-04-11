$(function(){
  $('[data-page]').each(function(){
    var $page = $(this),
        $originalPage = $page.find('.original-page'),
        $matchesOnOriginalPage = $originalPage.find('[data-match-id]'),
        $matchesOnExtractedPage = $page.find('.extracted-page [data-match-id]');

    $matchesOnExtractedPage.each(function(index){
      var $match = $(this),
          $matchOnOriginalPage = $($matchesOnOriginalPage[index]),
          relativeY = $matchOnOriginalPage.offset().top - $originalPage.offset().top - 2;

      $match.css({top: relativeY, position: 'relative'})
    });

  })
});
