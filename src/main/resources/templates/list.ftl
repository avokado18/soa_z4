<#include "/parts/header.ftl">
<script>
    $(function () {
        $('#addForm').hide();

        $('#add').click(function () {
            $('#addForm').show();
        });

        $('#create').click(function () {
            $.ajax({
                method: "POST",
                url: "/rest/users/",
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({
                    firstName: document.getElementById("newFirstName").value,
                    lastName: document.getElementById("newLastName").value,
                    birthday: document.getElementById("newBirthday").value,
                    address: document.getElementById("newAddress").value
                })
            })
                    .done(function () {
                        $('#addForm').hide();
                        location.reload();
                    });
        });

        $('.delete-btn').click(function () {
            var $deleteBtn = $(this);
            var userId = $deleteBtn.data('userId');
            $.ajax({
                method: "DELETE",
                url: "/rest/users/" + userId
            })
                    .done(function () {
                        $deleteBtn.closest('tr').fadeOut(700);
                    });
        });

        $('.edit-btn').click(function () {
            var $editBtn = $(this);
            var userId = $editBtn.data('userId');
            document.getElementById("edit"+userId).style.visibility="hidden";
            document.getElementById("save"+userId).style.visibility="visible";
            document.getElementById("firstName"+userId).removeAttribute("readonly");
            document.getElementById("lastName"+userId).removeAttribute("readonly");
            document.getElementById("birthday"+userId).removeAttribute("readonly");
            document.getElementById("address"+userId).removeAttribute("readonly");

        });

        $('.save-btn').click(function () {
            var $saveBtn = $(this);
            var userId = $saveBtn.data('userId');
            $.ajax({
                method: "PUT",
                url: "/rest/users/" + userId,
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({
                    firstName: document.getElementById("firstName"+userId).value,
                    lastName: document.getElementById("lastName"+userId).value,
                    birthday: document.getElementById("birthday"+userId).value,
                    address: document.getElementById("address"+userId).value
                })
            })
                    .done(function () {
                        $saveBtn.hide();
                        document.getElementById("edit"+userId).style.visibility="visible";
                        document.getElementById("firstName"+userId).setAttribute("readonly", "readonly");
                        document.getElementById("lastName"+userId).setAttribute("readonly", "readonly");
                        document.getElementById("birthday"+userId).setAttribute("readonly", "readonly");
                        document.getElementById("address"+userId).setAttribute("readonly", "readonly");
                    });

        });
    })

</script>
<div class="row">
    <div>
        <table class="table table-striped">
            <tr>
                <th>firstName</th>
                <th>lastName</th>
                <th>birthday</th>
                <th>address</th>
                <th> </th>
                <th> </th>
                <th> </th>
            </tr>
        <#list users as user>
            <tr>
                <td>
                    <input id="firstName${user.id!}"
                           class="form-control user-firstName"
                           type="text"
                           name="firstName"
                           value="${user.firstName}"
                           readonly/></td>
                <td><input id="lastName${user.id!}"
                           class="form-control user-lastName"
                           type="text"
                           name="lastName"
                           value="${user.lastName}"
                           readonly/></td>
                <td><input id="birthday${user.id!}"
                           class="form-control user-birthday"
                           type="date"
                           name="birthday"
                           value="${user.birthday?datetime?string('yyyy-MM-dd')}"
                           readonly/></td>
                <td><input id="address${user.id!}"
                           class="form-control user-address"
                           type="text"
                           name="address"
                           value="${user.address}"
                           readonly/></td>
                <td>
                    <button id="delete${user.id!}"
                            class="btn btn-danger btn-lg small delete-btn"
                            data-user-id="${user.id!}">Удалить</button></td>
                <td><button id="edit${user.id!}"
                            class="btn btn-primary btn-lg small edit-btn"
                            data-user-id="${user.id!}">Изменить</button></td>
                <td><button id="save${user.id!}"
                            class="btn btn-success btn-lg small save-btn"
                            style="visibility: hidden"
                            data-user-id="${user.id!}">Сохранить</button></td>
            </tr>
        </#list>
        </table>
        <button id="add" class="btn btn-primary btn-lg small add-btn">Add</button>
        <div id="addForm">
            <form>
                <label for="newFirstName">First Name</label>
                <input id="newFirstName"
                       class="form-control"
                       type="text" required/>
                <label for="newLastName">Last Name</label>
                <input id="newLastName"
                       class="form-control"
                       type="text" required/>
                <label for="newBirthday">Birthday</label>
                <input id="newBirthday"
                       class="form-control"
                       type="date" required/>
                <label for="newAddress">Address</label>
                <input id="newAddress"
                       class="form-control user-address"
                       type="text" required/>
                <button id="create" type="submit" class="btn btn-success btn-lg">Save</button>
            </form>
        </div>
    </div>
</div>
<br>
<br>
<#include "/parts/footer.ftl">