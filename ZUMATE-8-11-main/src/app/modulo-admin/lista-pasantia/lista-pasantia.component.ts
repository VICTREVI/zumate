import { Component, OnInit } from '@angular/core';
import { ParticipantesService } from './participantes.service';

@Component({
  selector: 'app-lista-chocolatada',
  templateUrl: './lista-pasantia.component.html',
  styleUrls: ['./lista-pasantia.component.css']
})
export class ListaPasantiaComponent implements OnInit {
  participantes: any[] = [];

  constructor(private participantesService: ParticipantesService) { }

  ngOnInit(): void {
    this.getParticipantes();
  }

  // Método para obtener la lista de participantes
  getParticipantes(): void {
    this.participantesService.getParticipantes().subscribe(data => {
      this.participantes = data;
    });
  }

// Método para eliminar un participante
deleteParticipante(id: number): void {
  if (confirm('¿Estás seguro de que deseas eliminar este participante?')) {
    this.participantesService.deleteParticipante(id).subscribe({
      next: (response) => {
        console.log(response);  // Verifica la respuesta de la eliminación
        alert('Participante eliminado exitosamente');
        this.getParticipantes();  // Recargar la lista de participantes después de eliminar
      },
    });
  }
}

  // Método para actualizar la tabla
  refreshTable(): void {
    this.getParticipantes(); // Llamar a getParticipantes para actualizar la lista
  }
}
