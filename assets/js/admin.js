var currentPage = 1;
var nbPage;

function getPageUsers() {
    fetch('api.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            action: "get-nb-users"
        })
    }).then(res => res.text())
    .then(data => {
        data = JSON.parse(data);
        if (data.success == true) {
            nbPage = Math.ceil(data.data[0] / 10);
            const pagingUser = document.querySelector('#paging-user');
            let htmlPaging = "";
            for (let numPage = 1; numPage < nbPage+1; numPage++) {
                if (numPage == currentPage) {
                    htmlPaging += `<button class="page-active"">${numPage}</button>`;
                } else {
                    htmlPaging += `<button onclick="getUsers(${numPage});">${numPage}</button>`;
                }
            }
            pagingUser.innerHTML = htmlPaging;
        }
    })
}

function getUsers(page = 1, limit = 10) {
    currentPage = page;
    getPageUsers();
    const offset = (page - 1) * limit;
    fetch('api.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            action: "get-users",
            limit: limit,
            offset: offset
        })
    }).then(res => res.text())
    .then(data => {
        data = JSON.parse(data);
        if (data.success == true) {
            // Ajout des users dans le tbodyUsers avec innerText pour eviter les faille XSS
            const tbodyUsers = document.querySelector('#dropdown-content-user table tbody');
            tbodyUsers.innerHTML = "";
            data.data.forEach(element => {
                let line = document.createElement('tr');

                let pseudo = document.createElement('td');
                pseudo.innerText = element.pseudo_user;
                line.appendChild(pseudo);
                
                let mail = document.createElement('td');
                mail.innerText = element.mail_user;
                line.appendChild(mail);

                let role = document.createElement('td');
                let roleButton = document.createElement('button');
                if (element.role_user == 1) {
                    roleButton.innerText = 'Admin'
                } else {
                    roleButton.innerText = 'Utilisateur'
                }
                role.appendChild(roleButton);
                line.appendChild(role);

                let deleteButton = document.createElement('td');
                deleteButton.className = 'btn-delete';
                let trashSvg = document.createElement('img');
                trashSvg.src = 'assets/svg/delete.svg';
                trashSvg.alt = "supprimer l'utilisateur";
                trashSvg.setAttribute('onclick', `deleteUser(${element.id_user})`);
                deleteButton.appendChild(trashSvg);
                line.appendChild(deleteButton);

                tbodyUsers.appendChild(line);
            })
        }
        return;
    });
}

function deleteUser(idUser) {
    fetch('api.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            action: "delete-user",
            id_user: idUser
        })
    }).then(res => res.text())
    .then(data => {
        data = JSON.parse(data);
        if (data.success == true) {
            getUsers(currentPage);
        }
    })
}

function showAndHideDropdown(table) {
    const dropdownContent = document.querySelector(`#dropdown-content-${table}`);
    dropdownContent.classList.contains('show') ? dropdownContent.classList.remove('show') : dropdownContent.classList.add('show');
}