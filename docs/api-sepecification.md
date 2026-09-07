## Required CRUD Endpoints

Implement every endpoint below for both resources

| Operation | HTTP method | Route | Successful response |
| --- | --- | --- | --- |
| Get all | `GET` | `/api/menuitems` and `/api/suppliers` | `200 OK` with a list |
| Get one | `GET` | `/api/menuitems/{id}` and `/api/suppliers/{id}` | `200 OK` with one object |
| Create | `POST` | `/api/menuitems` and `/api/suppliers` | `201 Created` with the new object |
| Update | `PUT` | `/api/menuitems/{id}` and `/api/suppliers/{id}` | `200 OK` with the updated object |
| Delete | `DELETE` | `/api/menuitems/{id}` and `/api/suppliers/{id}` | `204 No Content` |