function fn() {
  var random = Math.floor(Math.random() * 10000);

  return {
    nome: "prueba Test " + random,
    email: "prueba" + random + "@mail.com",
    password: "123456",
    administrador: "true"
  };
}