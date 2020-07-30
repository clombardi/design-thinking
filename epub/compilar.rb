#!/usr/bin/env ruby

class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def black;          colorize(30) end
  def red;            colorize(31) end
  def green;          colorize(32) end
  def yellow;         colorize(33) end
  def blue;           colorize(34) end
  def magenta;        colorize(35) end
  def cyan;           colorize(36) end
  def gray;           colorize(37) end
  
  def bg_black;       colorize(40) end
  def bg_red;         colorize(41) end
  def bg_green;       colorize(42) end
  def bg_brown;       colorize(43) end
  def bg_blue;        colorize(44) end
  def bg_magenta;     colorize(45) end
  def bg_cyan;        colorize(46) end
  def bg_gray;        colorize(47) end
  
  def bold;           "\e[1m#{self}\e[22m" end
  def italic;         "\e[3m#{self}\e[23m" end
  def underline;      "\e[4m#{self}\e[24m" end
  def blink;          "\e[5m#{self}\e[25m" end
  def reverse_color;  "\e[7m#{self}\e[27m" end
end


module DirectoryVisitor
  class << self
    def compilar_capitulo(numero, nombre)
      puts "Compilando capítulo #{numero}: #{nombre}...".green
      capitulo = ''
      Dir.chdir("../#{nombre}") do
        indice = File.read("#{nombre}.index.md")
        titulo = indice[/# (.+)/]
        capitulo = "#{titulo}\n\n"
        secciones = indice.scan(/\(\.\/([\/\w.-]+).md\)/)
        capitulo += secciones.map { |s| compilar_seccion(s[0]) }.join("\n")
      end

      File.write("./#{numero}-#{nombre}.md", capitulo)
    end

    def compilar_seccion(nombre)
      unless File.exist? "./#{nombre}.md"
        puts "OJO: el archivo #{nombre} no existe".red
        return
      end

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

capitulos = ['programacion-a-desarrollo', 'logica-algoritmica', 'abstracciones-patrones']
capitulos.each_with_index { |c, index| DirectoryVisitor.compilar_capitulo(index + 1, c) }
puts `pandoc -o ops-to-devops.epub --toc --toc-depth=2 title.txt *.md`
