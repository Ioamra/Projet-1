var currentPageUser, currentPageTopic, currentPageComment = 1;
var nbPageUser, nbPageTopic, nbPageComment;

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
            nbPageUser = Math.ceil(data.data[0] / 10);
            const pagingUser = document.querySelector('#paging-user');
            let htmlPaging = "";
            for (let numPage = 1; numPage < nbPageUser+1; numPage++) {
                if (numPage == currentPageUser) {
                    htmlPaging += `<button class="page-active"">${numPage}</button>`;
                } else {
                    htmlPaging += `<button onclick="getUsers(${numPage});">${numPage}</button>`;
                }
            }
            pagingUser.innerHTML = htmlPaging;
        }
    })
}

function getUsers(page = 1) {
    let limit = 10;
    currentPageUser = page;
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
            getUsers(currentPageUser);
            getTopics(currentPageTopic);
            getComments(currentPageComment);
        }
    })
}

function getPageTopics() {
    fetch('api.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            action: "get-nb-topics"
        })
    }).then(res => res.text())
    .then(data => {
        data = JSON.parse(data);
        if (data.success == true) {
            nbPageTopic = Math.ceil(data.data[0] / 10);
            const pagingTopic = document.querySelector('#paging-topic');
            let htmlPaging = "";
            for (let numPage = 1; numPage < nbPageTopic+1; numPage++) {
                if (numPage == currentPageTopic) {
                    htmlPaging += `<button class="page-active"">${numPage}</button>`;
                } else {
                    htmlPaging += `<button onclick="getTopics(${numPage});">${numPage}</button>`;
                }
            }
            pagingTopic.innerHTML = htmlPaging;
        }
    })
}

function getTopics(page = 1) {
    let limit = 10;
    currentPageTopic = page;
    getPageTopics();
    const offset = (page - 1) * limit;
    fetch('api.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            action: "get-topics",
            limit: limit,
            offset: offset
        })
    }).then(res => res.text())
    .then(data => {
        data = JSON.parse(data);
        if (data.success == true) {
            // Ajout des Topics dans le tbodyTopics avec innerText pour eviter les faille XSS
            const tbodyTopics = document.querySelector('#dropdown-content-topic table tbody');
            tbodyTopics.innerHTML = "";
            data.data.forEach(element => {
                let line = document.createElement('tr');

                let titre = document.createElement('td');
                titre.innerText = limitContent(element.title_topic, 50);
                line.appendChild(titre);

                let message = document.createElement('td');
                message.innerText = limitContent(element.message_topic, 50);
                line.appendChild(message);

                let date = document.createElement('td');
                date.innerText = element.date_topic;
                line.appendChild(date);

                let pseudo = document.createElement('td');
                pseudo.innerText = element.pseudo_user;
                line.appendChild(pseudo);

                let deleteButton = document.createElement('td');
                deleteButton.className = 'btn-delete';
                let trashSvg = document.createElement('img');
                trashSvg.src = 'assets/svg/delete.svg';
                trashSvg.alt = "supprimer l'utilisateur";
                trashSvg.setAttribute('onclick', `deleteTopic(${element.id_topic})`);
                deleteButton.appendChild(trashSvg);
                line.appendChild(deleteButton);

                tbodyTopics.appendChild(line);
            })
        }
        return;
    });
}

function deleteTopic(idTopic) {
    fetch('api.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            action: "delete-topic",
            id_Topic: idTopic
        })
    }).then(res => res.text())
    .then(data => {
        data = JSON.parse(data);
        if (data.success == true) {
            getTopics(currentPageTopic);
            getComments(currentPageComment);
        }
    })
}

function getPageComments() {
    fetch('api.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            action: "get-nb-comments"
        })
    }).then(res => res.text())
    .then(data => {
        data = JSON.parse(data);
        if (data.success == true) {
            nbPageComment = Math.ceil(data.data[0] / 10);
            const pagingComment = document.querySelector('#paging-comment');
            let htmlPaging = "";
            for (let numPage = 1; numPage < nbPageComment+1; numPage++) {
                if (numPage == currentPageComment) {
                    htmlPaging += `<button class="page-active"">${numPage}</button>`;
                } else {
                    htmlPaging += `<button onclick="getComments(${numPage});">${numPage}</button>`;
                }
            }
            pagingComment.innerHTML = htmlPaging;
        }
    })
}

function getComments(page = 1) {
    let limit = 10;
    currentPageComment = page;
    getPageComments();
    const offset = (page - 1) * limit;
    fetch('api.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            action: "get-comments",
            limit: limit,
            offset: offset
        })
    }).then(res => res.text())
    .then(data => {
        data = JSON.parse(data);
        if (data.success == true) {
            // Ajout des Comments dans le tbodyComments avec innerText pour eviter les faille XSS
            const tbodyComments = document.querySelector('#dropdown-content-comment table tbody');
            tbodyComments.innerHTML = "";
            data.data.forEach(element => {
                let line = document.createElement('tr');

                let commentaire = document.createElement('td');
                commentaire.innerText = limitContent(element.content_comment, 50);
                line.appendChild(commentaire);

                let date = document.createElement('td');
                date.innerText = element.date_comment;
                line.appendChild(date);

                let titre = document.createElement('td');
                titre.innerText = limitContent(element.title_topic, 50);
                line.appendChild(titre);

                let pseudo = document.createElement('td');
                pseudo.innerText = element.pseudo_user;
                line.appendChild(pseudo);

                let deleteButton = document.createElement('td');
                deleteButton.className = 'btn-delete';
                let trashSvg = document.createElement('img');
                trashSvg.src = 'assets/svg/delete.svg';
                trashSvg.alt = "supprimer l'utilisateur";
                trashSvg.setAttribute('onclick', `deleteComment(${element.id_comment})`);
                deleteButton.appendChild(trashSvg);
                line.appendChild(deleteButton);

                tbodyComments.appendChild(line);
            })
        }
        return;
    });
}

function deleteComment(idComment) {
    fetch('api.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            action: "delete-comment",
            id_Comment: idComment
        })
    }).then(res => res.text())
    .then(data => {
        data = JSON.parse(data);
        if (data.success == true) {
            getComments(currentPageComment);
        }
    })
}

function showAndHideDropdown(table) {
    const dropdownContent = document.querySelector(`#dropdown-content-${table}`);
    dropdownContent.classList.contains('show') ? dropdownContent.classList.remove('show') : dropdownContent.classList.add('show');
}