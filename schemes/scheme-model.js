const db = require('../data/db-config.js');

module.exports = {
    find,
    findById,
    findSteps, 
    add,
    update

}

function find() {
    return db('schemes')
}

function findById(id) {
    return db('schemes').where({id}).first()
}

function findSteps(id) {
    /* 
        select scheme_name, step_number, instructions 
        from steps as s
        join schemes as sc on s.schemes_id = sc.id
    */
    return db.from('schemes')
        .join('steps as s', 's.scheme_id', 'schemes.id')
        .where('schemes.id', id)
        .select('schemes.scheme_name', 's.step_number', 's.instructions')
}

function add(scheme) {
    return db('schemes').insert(scheme)
        .then(([id]) => {
            return findById(id)
        } )
}

function update(changes, id) {
    return db('schemes').update(changes).where('id', id)
        .then(updated => {
            return findById(id)
        })
}