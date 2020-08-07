class Empresa {
  int idEmpresa;
  String razaoSocial;
  String fantasia;
  String cnpj;
  String inscEstadual;
  String cep;
  String logradouro;
  String complemento;
  int numero;
  String bairro;
  String cidade;
  String estado;
  String telefone;
  String email;

Empresa(this.idEmpresa, this.razaoSocial, this.fantasia, this.cnpj, this.inscEstadual, this.cep,
 this.logradouro,this.complemento,this.numero, this.bairro, this.cidade, this.estado, this.telefone, this.email){
}







 int get getIdEmpresa => idEmpresa;

 set setIdEmpresa(int idEmpresa) => this.idEmpresa = idEmpresa;

 String get getRazaoSocial => razaoSocial;

 set setRazaoSocial(String razaoSocial) => this.razaoSocial = razaoSocial;

 String get getFantasia => fantasia;

 set setFantasia(String fantasia) => this.fantasia = fantasia;

 String get getCnpj => cnpj;

 set setCnpj(String cnpj) => this.cnpj = cnpj;

 String get getInscEstadual => inscEstadual;

 set setInscEstadual(String inscEstadual) => this.inscEstadual = inscEstadual;

 String get getCep => cep;

 set setCep(String cep) => this.cep = cep;

 String get getLogradouro => logradouro;

 set setLogradouro(String logradouro) => this.logradouro = logradouro;

 String get getComplemento => complemento;

 set setComplemento(String complemento) => this.complemento = complemento;

 int get getNumero => numero;

 set setNumero(int numero) => this.numero = numero;

 String get getBairro => bairro;

 set setBairro(String bairro) => this.bairro = bairro;

 String get getCidade => cidade;

 set setCidade(String cidade) => this.cidade = cidade;

 String get getEstado => estado;

 set setEstado(String estado) => this.estado = estado;

 String get getTelefone => telefone;

 set setTelefone(String telefone) => this.telefone = telefone;

 String get getEmail => email;

 set setEmail(String email) => this.email = email;

 
Map<String, dynamic> toMap(){
   var map =<String, dynamic>{
    'idEmpresa':idEmpresa,
    'razaoSocial':razaoSocial,
    'fantasia':fantasia,
    'cnpj':cnpj,
    'inscEstadual':inscEstadual,
    'cep':cep,
    'logradouro':logradouro,
    'complemento':complemento,
    'numero':numero,
    'bairro':bairro,
    'cidade':cidade,
    'estado':estado,
    'telefone':telefone,
    'email':email,
   };
   return map;
 }

 void setUserId(int id) {
    this.idEmpresa = id;
  }

 Empresa.fromMap(Map<String, dynamic> map){

   idEmpresa:map['idEmpresa'];
    razaoSocial:map['razaoSocial'];
    fantasia:map['fantasia'];
    cnpj:map['cnpj'];
    inscEstadual :map['inscEstadual'];
    cep:map['cep'];
    logradouro:map['logradouro'];
    complemento:map['complemento'];
    numero:map['numero'];
    bairro:map['bairro'];
    cidade:['cidade'];
    estado:map['estado'];
    telefone:['telefone'];
    email:map['email'];
   
 }

 Empresa.fromJson(Map<String, dynamic> json)
    :idEmpresa = json['name'],
    razaoSocial = json['name'],
    fantasia= json['name'],
    cnpj= json['name'],
    inscEstadual= json['name'],
    cep= json['name'],
    logradouro= json['name'],
    complemento= json['name'],
    numero= json['name'],
    bairro= json['name'],
    cidade= json['name'],
    estado= json['name'],
    telefone= json['name'],
    email= json['name'];
     
  Map<String, dynamic> toJson() =>
    {
    'idEmpresa':idEmpresa,
    'razaoSocial':razaoSocial,
    'fantasia':fantasia,
    'cnpj':cnpj,
    'inscEstadual':inscEstadual,
    'cep':cep,
    'logradouro':logradouro,
    'complemento':complemento,
    'numero':numero,
    'bairro':bairro,
    'cidade':cidade,
    'estado':estado,
    'telefone':telefone,
    'email':email,
      
    };




 
}