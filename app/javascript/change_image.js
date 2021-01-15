window.addEventListener("load", function (e) {
  const file_reader = new FileReader();
  const get_image = document.querySelector(".js_get_image");
  get_image.addEventListener("change", function () {
    file_reader.addEventListener("load", function (e) {
      set_image = document.querySelector(".js_set_image");
      set_image.setAttribute("src", file_reader.result);
    });
    file_reader.readAsDataURL(this.files[0]);
  });
});
