$ ->
  $(".activeadmin-translations > ul").each ->
    $tabs = $("li > a", this)
    $contents = $(this).siblings("fieldset")

    $tabs.click ->
      $tab = $(this)
      $tabs.not($tab).removeClass("active")
      $tab.addClass("active")
      $contents.hide()
      $contents.filter($tab.attr("href")).show()
      false

    $tabs.eq(0).click()
