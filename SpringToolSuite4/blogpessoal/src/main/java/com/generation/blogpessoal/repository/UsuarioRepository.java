package com.generation.blogpessoal.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.generation.blogpessoal.model.Usuario;

@Repository
	public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
		public Optional<Usuario> findByUsuario (String usuario);
		//Quando não se sabe qual tipo de resposta pode ter ao buscar na requisição e tem mais de uma possível

}

