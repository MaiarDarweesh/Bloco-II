package com.generation.mundogames.controller;

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

import com.generation.mundogames.model.Categoria;
import com.generation.mundogames.model.Produto;
import com.generation.mundogames.repository.CategoriaRepository;

@RestController
@RequestMapping("/categoria")
@CrossOrigin("*")
public class CategoriaController {
	@Autowired
	private CategoriaRepository repository;
	
	@GetMapping 
		public ResponseEntity<List<Categoria>> GetAll(){ 
			return ResponseEntity.ok(repository.findAll());
	}
	
	
	/*@GetMapping ("/{id}")
	public ResponseEntity<List<Categoria>> GetAll (){
		return ResponseEntity.ok(repository.findAll());
	}*/
	
	@GetMapping ("/setor/{setor}")
	public ResponseEntity<List<Categoria>> GetBySetor(@PathVariable String setor) {
		return ResponseEntity.ok(repository.findAllBySetorContainingIgnoreCase (setor));
	}
	
	@PostMapping
	public ResponseEntity<Categoria> post (@Valid @RequestBody Categoria categoria){
		return ResponseEntity.status(HttpStatus.CREATED).body(repository.save(categoria));
	}
	@PutMapping
	public ResponseEntity<Categoria> put (@Valid @RequestBody Categoria categoria){
		return ResponseEntity.status(HttpStatus.OK).body(repository.save(categoria));
	}
	@DeleteMapping ("/{id}")
	public void delete (@PathVariable long id) {
		repository.deleteById(id);
	}

}
