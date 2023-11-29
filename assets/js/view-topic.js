function addComment(idTopic, idUser) {
    const textarea = document.querySelector('#content-comment');
    const comment = textarea.value;
    fetch('api.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            action: "add-comment",
            id_topic: idTopic,
            id_user: idUser,
            comment: comment
        })
    }).then(res => res.text())
    .then(data => {
        data = JSON.parse(data);
        if (data.success == true) {
            textarea.value = "";
            // ! Ajouter le nouveau commentaire sur la page
        }
        return;
    });
}

function getComment(idTopic) {
    fetch('api.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            action: "get-comments",
            id_topic: idTopic
        })
    }).then(res => res.text())
    .then(data => {
        data = JSON.parse(data);
        // Ajout des commentaires avec innerText pour eviter les faille XSS
        let commentContainer = document.getElementById('comment-container');
        data.data.forEach(element => {
            let article = document.createElement('article');
            article.className = 'comment';

            let contentSection = document.createElement('section');
            contentSection.className = 'comment-content';
            contentSection.innerText = element.content_comment;
            article.appendChild(contentSection);

            let authorAndDateSection = document.createElement('section');
            authorAndDateSection.className = 'comment-author-and-date';
            
            let authorInfo = document.createElement('i');
            authorInfo.innerText = 'de ' + element.pseudo_user;
            authorAndDateSection.appendChild(authorInfo);

            let dateInfo = document.createElement('i');
            dateInfo.innerText = element.date_comment;
            authorAndDateSection.appendChild(dateInfo);

            article.appendChild(authorAndDateSection);
            commentContainer.appendChild(article);
        });
        return;
    })
}