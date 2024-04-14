package com.example.notetakingapp;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/notes")
public class control {

    @Autowired 
    private repo noteRepository; // Autowire your repository interface
    
    @GetMapping("/home")
    public String home() {
        return "home"; // Return the name of your JSP file for the home page
    }

    @GetMapping
    public String getAllNotes(Model model) {
        List<note> notes = noteRepository.findAll(); // Use the findAll() method from the autowired repository
        model.addAttribute("notes", notes);
        return "notes"; // Assuming you have a JSP file named "notes.jsp" to display all notes
    }

    @PostMapping
    public String createNote(@RequestParam("title") String title, @RequestParam("content") String content) {
        note newNote = new note();
        newNote.setTitle(title);
        newNote.setContent(content);
        note createdNote = noteRepository.save(newNote);
        return "redirect:/notes/home"; // Redirect to the home page
    }


    /* @PutMapping("/{id}")
    public ResponseEntity<note> updateNote(@PathVariable Long id, @RequestBody note note) {
        Optional<note> existingNoteOptional = noteRepository.findById(id);
        if (existingNoteOptional.isPresent()) {
            note existingNote = existingNoteOptional.get();
            existingNote.setTitle(note.getTitle());
            existingNote.setContent(note.getContent());
            note updatedNote = noteRepository.save(existingNote);
            return ResponseEntity.ok(updatedNote);
        } else {
            return ResponseEntity.notFound().build();
        }
    }*/

    
   

 @GetMapping("/update")
    public String updateNoteById(@RequestParam("noteId") Long id, Model model) {
        Optional<note> existingNoteOptional = noteRepository.findById(id);
        if (existingNoteOptional.isPresent()) {
            note existingNote = existingNoteOptional.get();
            model.addAttribute("note", existingNote);
            return "notes"; // Assuming you have a JSP file named "update.jsp"
        } else {
            return "error"; // Handle not found case appropriately
        }
    }
    
    @PostMapping("/updateFormData")
    public String updateNoteFormData(@RequestParam("noteId") Long noteId,
                                     @RequestParam("title") String title,
                                     @RequestParam("content") String content,
                                     RedirectAttributes redirectAttributes) {
        Optional<note> existingNoteOptional = noteRepository.findById(noteId);
        if (existingNoteOptional.isPresent()) {
            note existingNote = existingNoteOptional.get();
            existingNote.setTitle(title);
            existingNote.setContent(content);
            noteRepository.save(existingNote);
            redirectAttributes.addFlashAttribute("successMessage", "Note updated successfully!");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Note with ID " + noteId + " not found.");
        }
        return "redirect:/notes/home";
    }
    @PostMapping("/delete")
    public String deleteNoteById(@RequestParam("noteId") Long noteId, Model model) {
        // Your delete logic here
        Optional<note> noteOptional = noteRepository.findById(noteId);
        if (noteOptional.isPresent()) {
            note noteToDelete = noteOptional.get();
            Long deletedNoteId = noteToDelete.getId(); // Get the ID of the deleted note
            String deletedNoteTitle = noteToDelete.getTitle(); // Get the title of the deleted note
            String deletedNoteContent = noteToDelete.getContent(); // Get the content of the deleted note
            noteRepository.delete(noteToDelete);
            model.addAttribute("deletedNoteId", deletedNoteId); // Pass the deleted note's ID to the view
            model.addAttribute("deletedNoteTitle", deletedNoteTitle); // Pass the deleted note's title to the view
            model.addAttribute("deletedNoteContent", deletedNoteContent); // Pass the deleted note's content to the view
            return "delete"; // Redirect to the delete.jsp page after deletion
        } else {
            // Handle case where note with given ID is not found
            return "error"; // You can redirect to an error page or simply back to the home page
        }
    }


    
    

}
