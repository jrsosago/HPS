import { TestBed, inject } from '@angular/core/testing';

import { HspService } from './hsp.service';

describe('HspService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [HspService]
    });
  });

  it('should be created', inject([HspService], (service: HspService) => {
    expect(service).toBeTruthy();
  }));
});
