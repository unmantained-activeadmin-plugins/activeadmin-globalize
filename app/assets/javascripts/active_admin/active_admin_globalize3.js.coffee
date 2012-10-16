$ ->
  $(".locales-tabs").each ->
    tabs = $("li > a", this)
    contents = $(this).siblings(".locales-contents").children()

    tabs.click ->
      tabs.removeClass("active")
      contents.hide()
      $($(this).addClass("active").attr("href")).show()
      false

    tabs.eq(0).click()
