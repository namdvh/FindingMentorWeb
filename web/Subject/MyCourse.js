function openCity(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;
  
    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
    }
  
    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
  
    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
  }

  const button = document.querySelector(".buttonCreate");
const template = ` <div class="modal">
<div class="modal-content">
  <form action="">
    <div class="row gutters">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
          <h6 class="mb-2 text-primary">Create New Course</h6>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="fullName">Name Course</label>
              <input type="text" class="form-control" id="fullName" placeholder="Name Course">
          </div>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="eMail">Name Mentor</label>
              <input type="email" class="form-control" id="eMail" placeholder="Name Mentor">
          </div>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="phone">Name Subject</label>
              <input type="text" class="form-control" id="phone" placeholder="Name Subject">
          </div>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="website">Description</label>
              <input type="birthday" class="form-control" id="website" placeholder="Description">
          </div>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
        <div class="update">
          <h5>Update avatar</h5>
          <!-- <p style="font-size: 13px;">I'm Yuki. Full Stack Designer I enjoy creating user-centric, delightful and human experiences.</p> -->
      </div>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
        <button style="margin-left: 250px;" type="button" id="submit" name="submit" class="btn btn-success">Update</buttons>
      </div>
  </div>
  </form>
</div>
</div>`

button.addEventListener("click", handleClickButton);
function handleClickButton(){
    document.body.insertAdjacentHTML("beforeend", template)
};
//document.body.addEventListener("click", function(event){
//    if(event.target.matches(".modal-close")){
//        // handle close modal here
//        const modal = document.querySelector(".modal");
//        modal.parentNode.removeChild(modal)
//    }else if(event.target.matches(".modal")){
//        const modal = document.querySelector(".modal");
//        modal.parentNode.removeChild(modal)
//    }
//})
