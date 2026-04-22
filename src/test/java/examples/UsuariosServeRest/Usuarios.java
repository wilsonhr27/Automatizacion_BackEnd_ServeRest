package examples.UsuariosServeRest;

import com.intuit.karate.junit5.Karate;

public class Usuarios {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("EliminarUsuario").relativeTo(getClass());
    }
}
