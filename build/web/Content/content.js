// ButtonChapter
const button = document.querySelector(".buttonCreate");
const buttonEditChapter = document.querySelector(".buttonEditChapter");
const buttonPlusChapter = document.querySelector(".buttonPlusChapter");
const editContent = document.querySelector(".editContent");
const modal = document.querySelector(".modal");
const hide = document.querySelector(".hide");
const buttonModalCreate = document.querySelector(".modalCreate");
const modalCreateChapter = document.querySelector("#modalCreateChapter");

// const template = `<div class="modal">
// <div class="modal-content">
//   <form action="">
//     <div class="row gutters">
//       <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
//           <h6 class="mb-2 text-primary">Create Chapter</h6>
//       </div>
//       <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
//           <div class="form-group">
//               <label for="fullName">New Chapter</label>
//               <input type="text" class="form-control" id="fullName" placeholder="New Chapter">
//           </div>
//       </div>
//       <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
//           <div class="form-group">
//               <label for="eMail">Chapter Name</label>
//               <input type="email" class="form-control" id="eMail" placeholder="Chapter Name">
//           </div>
//       </div>
//       <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
//           <div class="form-group">
//               <label for="phone">Name Subject</label>
//               <input type="text" class="form-control" id="phone" placeholder="Name Subject">
//           </div>
//       </div>

//       <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
//         <div class="update">
//         <input type="Addlink" placeholder="AddVideo">
//           <!-- <p style="font-size: 13px;">I'm Yuki. Full Stack Designer I enjoy creating user-centric, delightful and human experiences.</p> -->
//       </div>
//       </div>
//       <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
//         <button style="margin-left: 250px;" type="button" id="submit" name="submit" class="btn btn-success">Update</buttons>
//       </div>
//   </div>
//   </form>
// </div>
// </div>`;

const templateEditChapter = `<div class="modal">
<div class="modal-content">
  <form action="">
    <div class="row gutters">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
          <h6 class="mb-2 text-primary">Update Chapter</h6>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="fullName">Chapter Name</label>
              <input type="text" class="form-control" id="fullName" placeholder="Chapter Name">
          </div>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="eMail">Description</label>
              <input type="email" class="form-control" id="eMail" placeholder="Description">
          </div>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
        <button style="text-align: center;" type="button" id="submit" name="submit" class="btn btn-success">Update Chapter</buttons>
      </div>
  </div>
  </form>
</div>
</div>`;

const templatePlusChapter = `<div class="modal">
<div class="modal-content">
  <form action="">
    <div class="row gutters">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
          <h6 class="mb-2 text-primary">Create Content</h6>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="fullName">Content Name</label>
              <input type="text" class="form-control" id="fullName" placeholder="Content Name">
          </div>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="eMail">Video URL</label>
              <input type="email" class="form-control" id="eMail" placeholder="Video URL">
          </div>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="phone">Blog</label>
              <input type="text" class="form-control" id="phone" placeholder="Blog">
          </div>
      </div>   
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
        <button style="margin-top: 30px; margin-left: 120px"  type="button" id="submit" name="submit" class="btn btn-success">Create Content</buttons>
      </div>
  </div>
  </form>
</div>
</div>`;

const templateEditContent = `<div class="modal">
<div class="modal-content">
  <form action="">
    <div class="row gutters">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
          <h6 class="mb-2 text-primary">Edit Content</h6>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="fullName">Content Name</label>
              <input type="text" class="form-control" id="fullName" placeholder="Content Name">
          </div>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="eMail">Video URL</label>
              <input type="email" class="form-control" id="eMail" placeholder="Video URL">
          </div>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
          <div class="form-group">
              <label for="phone">Blog</label>
              <input type="text" class="form-control" id="phone" placeholder="Blog">
          </div>
      </div>   
      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
        <button style="margin-top: 30px; margin-left: 120px"  type="button" id="submit" name="submit" class="btn btn-success">Update Content</buttons>
      </div>
  </div>
  </form>
</div>
</div>`;
//

editContent.addEventListener("click", handleClickEditContent);
function handleClickEditContent() {
  document.body.insertAdjacentHTML("beforeend", templateEditContent);
}

//

buttonPlusChapter.addEventListener("click", handleClickPlusChapter);
function handleClickPlusChapter() {
  document.body.insertAdjacentHTML("beforeend", templatePlusChapter);
}

//
buttonEditChapter.addEventListener("click", handleClickButtonEditChapter);
function handleClickButtonEditChapter() {
  document.body.insertAdjacentHTML("beforeend", templateEditChapter);
}
//
buttonModalCreate.addEventListener("click", handleClickButton);
function handleClickButton() {
  modalCreateChapter.style.display = "block";
}

document.body.addEventListener("click", function (event) {
  if (event.target.matches(".modal-close")) {
    // handle close modal here
    const modal = document.querySelector(".modal");
    modal.parentNode.removeChild(modal);
  } else if (event.target.matches(".modal")) {
    const modal = document.querySelector(".modal");
    modal.parentNode.removeChild(modal);
  }
});

// buttonLesson
