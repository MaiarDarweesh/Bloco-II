package com.generation.mundogames.security;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.generation.mundogames.model.Usuario;
import com.generation.mundogames.repository.UsuarioRepositoryGames;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{
	
	@Autowired
	private UsuarioRepositoryGames userRepositoryGamer;
	
	@Override
	public UserDetails loadUserByUsername (String userName) throws UsernameNotFoundException {
		Optional<Usuario> usuario = userRepositoryGamer.findByUsuario(userName);
		usuario.orElseThrow(()-> new UsernameNotFoundException(userName + "Usuario não encontrado"));
		return usuario.map(UserDetailsImpl::new).get();
		} 
	
}
