// ButtonChapter
const buttonEdit = document.querySelector(".buttonCreate");
const template = ` <div class="modal">
<div class="modal-content">
  <form action="">
    <div class="row gutters">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
          <h6 class="mb-2 text-primary">Chapter</h6>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="fullName">New Chapter</label>
              <input type="text" class="form-control" id="fullName" placeholder="New Chapter">
          </div>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="eMail">Chapter Name</label>
              <input type="email" class="form-control" id="eMail" placeholder="Chapter Name">
          </div>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="phone">Name Subject</label>
              <input type="text" class="form-control" id="phone" placeholder="Name Subject">
          </div>
      </div>
     
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
        <div class="update">
        <input type="Addlink" placeholder="AddVideo">
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

buttonEdit.addEventListener("click", handleClickButton);
function handleClickButton(){
    document.body.insertAdjacentHTML("beforeend", template)
};
document.body.addEventListener("click", function(event){
    if(event.target.matches(".modal-close")){
        // handle close modal here
        const modal = document.querySelector(".modal");
        modal.parentNode.removeChild(modal)
    }else if(event.target.matches(".modal")){
        const modal = document.querySelector(".modal");
        modal.parentNode.removeChild(modal)
    }
})

// buttonLesson
