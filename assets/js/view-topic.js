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
        console.log(data.data);
        // ! Afficher les donner sur la page 
        return;
    })
}