package com.generation.mundogames.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.generation.mundogames.model.Usuario;
import com.generation.mundogames.model.UsuarioLoginGames;
import com.generation.mundogames.repository.UsuarioRepositoryGames;
import com.generation.mundogames.service.UsuarioServiceGames;

@RestController
@RequestMapping("/usuario")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class UsuarioControllerGames {
	
	@Autowired
	private UsuarioServiceGames usuarioServiceGames;
	
	@Autowired
	private UsuarioRepositoryGames usuarioRepositoryGames;
	
	@GetMapping("/all")
	public ResponseEntity<List<Usuario>> getAll() {

		return ResponseEntity.ok(usuarioRepositoryGames.findAll());

	}
	@PostMapping ("/logar")
	public ResponseEntity<UsuarioLoginGames> login(@RequestBody Optional<UsuarioLoginGames> user) {
		return usuarioServiceGames.autenticaUsuario(user).map(resposta -> ResponseEntity.ok(resposta))
				.orElse(ResponseEntity.status(HttpStatus.UNAUTHORIZED).build());
	}
	@PostMapping("/cadastrar")
	public ResponseEntity<Usuario> postUsuario(@Valid @RequestBody Usuario usuario) {

		return usuarioServiceGames.cadastraUsuario(usuario)
				.map(resposta -> ResponseEntity.status(HttpStatus.CREATED).body(resposta))
				.orElse(ResponseEntity.status(HttpStatus.BAD_REQUEST).build());
	}
	@PutMapping
	public ResponseEntity<Usuario> putUsuario (@Valid @RequestBody Usuario usuario){
		return ResponseEntity.status(HttpStatus.OK).body(usuarioRepositoryGames.save(usuario));
	}
	@DeleteMapping("/{id}")
	public void delete (@PathVariable Long id) {
		usuarioRepositoryGames.deleteById(id);
	}
}
