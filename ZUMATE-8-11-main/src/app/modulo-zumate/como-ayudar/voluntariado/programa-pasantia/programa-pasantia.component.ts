// pasantia.component.ts
import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { catchError } from 'rxjs/operators';
import { of } from 'rxjs';
import { PasantiaService } from './programa-pasantia.service';

@Component({
  selector: 'app-pasantia',
  templateUrl: './programa-pasantia.component.html',
  styleUrls: ['./programa-pasantia.component.css']
})
export class ProgramaPasantiaComponent {
  form: FormGroup;
  semestres: string[] = ['Primer Ciclo', 'Segundo Ciclo', 'Tercer Ciclo', 'Cuarto Ciclo', 'Quinto Ciclo', 'Sexto Ciclo', 'Septimo Ciclo', 'Octavo Ciclo', 'Noveno Ciclo', 'Decimo Ciclo'];
  tiempos: string[] = ['Menos de 5 horas', '5 - 10 horas', '10 - 15 horas', '15 - 20 horas', '20 - 25 horas', 'Más de 25 horas'];
  mensaje: string = '';

  constructor(
    private fb: FormBuilder,
    private pasantiaService: PasantiaService
  ) {this.form = this.fb.group({
    nombre: ['', [Validators.required, Validators.maxLength(50), Validators.pattern(/^[a-zA-Z ]*$/)]],
    apellidos: ['', [Validators.required, Validators.maxLength(50), Validators.pattern(/^[a-zA-Z ]*$/)]],
    dni: ['', [Validators.required, Validators.pattern(/^\d{8}$/)]],
    email: ['', [Validators.required, Validators.email]],
    telefono: ['', [Validators.required, Validators.pattern(/^\d+$/), Validators.maxLength(20)]],
    institucion: ['', [Validators.required, Validators.maxLength(50), Validators.pattern(/^[a-zA-Z ]*$/)]],
    carrera: ['', [Validators.required, Validators.maxLength(50), Validators.pattern(/^[a-zA-Z ]*$/)]],
    ciclo: ['', [Validators.required]],
    horas: ['', [Validators.required]]
  });}

  onSubmit() {
    if (this.form.valid) {
      // Enviar el formulario con los datos del formulario (no hardcodeados)
      const formData = this.form.value;
      this.pasantiaService.enviarFormulario(formData).pipe(
        catchError(error => {
          // Si ocurre un error en la solicitud, mostramos un mensaje
          this.mensaje = 'Hubo un error al enviar tu solicitud. Por favor, inténtalo nuevamente.';
          return of(null); // Regresamos un observable vacío para no romper la ejecución
        })
      ).subscribe(response => {
        if (response) {
          // Si la respuesta es exitosa, mostramos el mensaje de éxito
          this.mensaje = '¡Tu solicitud ha sido enviada exitosamente!';
          this.form.reset(); // Limpiar el formulario
        }
      });
    } else {
      this.mensaje = 'Por favor, completa correctamente todos los campos.';
    }
  }
}
