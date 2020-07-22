#!/usr/bin/env ruby

capitulos = ['programacion-a-desarrollo', 'logica-algoritmica', 'abstracciones-patrones']

module DirectoryVisitor
  class << self
    def compilar_capitulo(numero, nombre)
      puts "Compilando capítulo #{numero}: #{nombre}..."
      capitulo = ''
      Dir.chdir("./#{nombre}") do
        indice = File.read("#{nombre}.index.md")
        titulo = indice[/# (.+)/]
        capitulo = "#{titulo}\n\n"
        secciones = indice.scan(/\(\.\/([\/\w.-]+).md\)/)
        capitulo += secciones.map { |s| compilar_seccion(s[0]) }.join("\n")
      end

      File.write("./epub/#{numero}-#{nombre}.md", capitulo)
    end

    def compilar_seccion(nombre)
      return unless File.exist? "./#{nombre}.md"
      File.read("./#{nombre}.md").gsub(/^(#+)/, '\1#')
    end

    def dir?(path)
      File.directory? path
    end

    def entries
      Dir.glob('*')
    end

    def filename(path)
      File.basename(path, File.extname(path))
    end

    def files
      entries.reject { |f| dir? f }
    end

    def dirs
      entries.select { |f| dir? f }
    end
  end
end

capitulos.each_with_index { |c, index| DirectoryVisitor.compilar_capitulo(index + 1, c) }
