package com.generation.mundogames.service;

import java.nio.charset.Charset;
import java.util.Optional;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.generation.mundogames.model.Usuario;
import com.generation.mundogames.model.UsuarioLoginGames;
import com.generation.mundogames.repository.UsuarioRepositoryGames;


@Service
public class UsuarioServiceGames {
	@Autowired
	private UsuarioRepositoryGames repository;
	public Optional<Usuario> cadastraUsuario (Usuario usuario) {
		if(repository.findByUsuario(usuario.getUsuario()).isPresent())
			return Optional.empty();
		usuario.setSenha(criptografarSenha(usuario.getSenha()));
		return Optional.of(repository.save(usuario));
		}
	private String criptografarSenha (String senha) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		return encoder.encode(senha);
	}
	public Optional<UsuarioLoginGames> autenticaUsuario(Optional<UsuarioLoginGames> usuarioLoginGames) {
		Optional<Usuario> usuario = repository.findByUsuario(usuarioLoginGames.get().getUsuario());
		
		if(usuario.isPresent()) {
			if(compararSenhas(usuarioLoginGames.get().getSenha(), usuario.get().getSenha())) {
				usuarioLoginGames.get().setId(usuario.get().getId());
				usuarioLoginGames.get().setNome(usuario.get().getNome());
				usuarioLoginGames.get().setFoto(usuario.get().getFoto());
				usuarioLoginGames.get().setToken(gerarBasicToken(usuarioLoginGames.get().getUsuario(),usuarioLoginGames.get().getSenha()));
				usuarioLoginGames.get().setSenha(usuario.get().getSenha());
			}
		}
		return Optional.empty();
	}
	private boolean compararSenhas(String senhaDigitada, String senhaBanco) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(senhaDigitada, senhaBanco);
	}
	private String gerarBasicToken (String usuario, String senha) {
		String token = usuario + ":" + senha;
		byte[] tokenBase64 = Base64.encodeBase64(token.getBytes(Charset.forName("US-ASCII")));
		return "Basic " + new String(tokenBase64);
	}
}
