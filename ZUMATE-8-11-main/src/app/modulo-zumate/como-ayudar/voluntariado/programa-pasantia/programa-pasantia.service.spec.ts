import { TestBed } from '@angular/core/testing';

import { ProgramaPasantiaService } from './programa-pasantia.service';

describe('ProgramaPasantiaService', () => {
  let service: ProgramaPasantiaService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ProgramaPasantiaService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
