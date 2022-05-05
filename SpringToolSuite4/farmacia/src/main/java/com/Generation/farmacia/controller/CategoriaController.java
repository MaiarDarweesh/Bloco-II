package com.Generation.farmacia.controller;

import java.util.List;

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

import com.Generation.farmacia.model.Categoria;
import com.Generation.farmacia.repository.CategoriaRepository;

@RestController
@RequestMapping("/categoria")
@CrossOrigin("*")
public class CategoriaController {
	@Autowired
	private CategoriaRepository repository;
	

	@GetMapping
	public ResponseEntity<List<Categoria>> GetAll() {
		return ResponseEntity.ok(repository.findAll());
	}

	@GetMapping("/{id}")
	public ResponseEntity<Categoria> getById(@PathVariable long id) {
		return repository.findById(id).map(resp -> ResponseEntity.ok(resp)).orElse(ResponseEntity.notFound().build());
	}

	//@GetMapping("/titulo/ {titulo}")
	//public ResponseEntity<List<Categoria>> GetByTitulo(@PathVariable String titulo) {
		//return ResponseEntity.ok(repository.findAllByTituloContainingIgnoreCase(titulo)); //ByTituloContainingIgnoteCase
	//}

	@PostMapping
	public ResponseEntity<Categoria> postCategoria(@Valid @RequestBody Categoria categoria) {
		return ResponseEntity.status(HttpStatus.CREATED).body(repository.save(categoria));
	}

	@PutMapping
	public ResponseEntity<Categoria> putCategoria(@Valid @RequestBody Categoria categoria) {
		return ResponseEntity.status(HttpStatus.OK).body(repository.save(categoria));
	}

	@DeleteMapping("/{id}")
	public void delete(@PathVariable long id) {
		repository.deleteById(id);
	}
}
